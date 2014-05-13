/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.coeus.propdev.impl.person;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.coeus.common.api.sponsor.hierarchy.SponsorHierarchyService;
import org.kuali.coeus.common.framework.person.editable.PersonEditableService;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.PropAwardPersonRole;
import org.kuali.coeus.common.framework.person.attr.PersonBiosketch;
import org.kuali.coeus.common.framework.person.attr.PersonDegree;
import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.coeus.common.framework.type.InvestigatorCreditType;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.coeus.common.framework.ynq.Ynq;
import org.kuali.coeus.common.framework.ynq.YnqService;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.person.attachment.ProposalPersonBiography;
import org.kuali.coeus.propdev.impl.person.attachment.ProposalPersonBiographyAttachment;
import org.kuali.coeus.propdev.impl.person.creditsplit.CreditSplit;
import org.kuali.coeus.propdev.impl.person.creditsplit.ProposalPersonCreditSplit;
import org.kuali.coeus.propdev.impl.person.creditsplit.ProposalUnitCreditSplit;
import org.kuali.kra.award.home.ContactRole;
import org.kuali.kra.budget.personnel.PersonRolodex;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.coeus.sys.api.model.ScaleTwoDecimal;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.kew.api.WorkflowDocument;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.util.*;

import static org.apache.commons.lang3.StringUtils.isNotBlank;

/**
 * A Service implementation for persisted modifications of Key Personnel related business objects
 *
 * @see org.kuali.coeus.propdev.impl.person.ProposalPerson
 * @author $Author: gmcgrego $
 * @version $Revision: 1.34 $
 */
@Component("keyPersonnelService")
public class KeyPersonnelServiceImpl implements KeyPersonnelService, Constants {

    private static final Log LOG = LogFactory.getLog(KeyPersonnelServiceImpl.class);

    private static final String READ_ONLY_ROLES_PARAM_NAME = "personrole.readonly.roles";
    private static final String ROLODEX_PERSON = "Unknown";
    private static final String NIH_PARM_KEY = "nih.";

    @Autowired
    @Qualifier("businessObjectService")
    private BusinessObjectService businessObjectService;
    @Autowired
    @Qualifier("ynqService")
    private YnqService ynqService;
    @Autowired
    @Qualifier("parameterService")
    private ParameterService parameterService;
    @Autowired
    @Qualifier("sponsorHierarchyService")
    private SponsorHierarchyService sponsorHierarchyService;
    
    @Autowired
    @Qualifier("personEditableService")
    private PersonEditableService personEditableService;
    @Autowired
    @Qualifier("proposalPersonService")
    ProposalPersonService proposalPersonService;

    protected ProposalPersonService getProposalPersonService (){return proposalPersonService;}
    public  void setProposalPersonService (ProposalPersonService proposalPersonService){
        this.proposalPersonService = proposalPersonService;
    }

    /**
     * Part of a complete breakfast, it has everything you need to populate Key Personnel into a <code>{@link ProposalDevelopmentDocument}</code>
     * 
     * @param document
     */
    public void populateDocument(ProposalDevelopmentDocument document) {
        if(hasBeenRoutedOrCanceled(document)){
            Collection<InvestigatorCreditType> availableCreditTypes=getAllInvestigatorCreditTypes();
            Set<InvestigatorCreditType> usedCreditTypes = new HashSet<InvestigatorCreditType>();
            for (ProposalPerson person : document.getDevelopmentProposal().getInvestigators()) {
                for(ProposalPersonCreditSplit creditSplit : person.getCreditSplits()){
                    for(InvestigatorCreditType currentCreditType : availableCreditTypes){
                        if(currentCreditType.getInvCreditTypeCode().equals(creditSplit.getInvCreditTypeCode())){
                            usedCreditTypes.add(currentCreditType);
                        }
                    }
                }
            }
            document.getDevelopmentProposal().setInvestigatorCreditTypes(usedCreditTypes);          
        }else
        {
            document.getDevelopmentProposal().setInvestigatorCreditTypes(getInvestigatorCreditTypes());
        }
        if (document.getDevelopmentProposal().getInvestigators().isEmpty() && !document.getDevelopmentProposal().getProposalPersons().isEmpty()) {
            LOG.info("Need to repopulate investigator list");
            populateInvestigators(document);
            if(!(document.getDocumentHeader().getWorkflowDocument().getStatus().getCode().equals("R"))){
                populateActiveCredittypesPerson(document);
            }
        }
        /* check for new certification questions */
        for (ProposalPerson person : document.getDevelopmentProposal().getProposalPersons()) {
            getYnqService().getPersonYNQ(person, document);
        }
    }
    /**
     * It populates the Active credit type in the proposalpersoncreditsplit and unitcreditsplit
     *
     * @param document
     * @return true or false
     */
    public void populateActiveCredittypesPerson(ProposalDevelopmentDocument document){
        Collection<InvestigatorCreditType> invcrdttype=getInvestigatorCreditTypes();
        for (ProposalPerson person : document.getDevelopmentProposal().getInvestigators()) {
            for(InvestigatorCreditType invcredtype:invcrdttype){
                boolean creditTypeFound = false;
                for(ProposalPersonCreditSplit proposalpersoncrdt:person.getCreditSplits()){
                    if((invcredtype.getInvCreditTypeCode().equals(proposalpersoncrdt.getInvCreditTypeCode()))){
                        creditTypeFound = true;
                        break;
                    }
                }
                if (!creditTypeFound ) {
                    ProposalPersonCreditSplit creditSplit = new ProposalPersonCreditSplit();
                    creditSplit.setProposalPerson(person);
                    creditSplit.setInvCreditTypeCode(invcredtype.getInvCreditTypeCode());
                    creditSplit.setCredit(new ScaleTwoDecimal(0));
                    person.getCreditSplits().add(creditSplit);
                }
            }
            for(ProposalPersonUnit unitsplit:person.getUnits()){
                for(InvestigatorCreditType invcrdtype:invcrdttype){
                    boolean creditTypeFound = false;
                    for(ProposalUnitCreditSplit unitcreditsplit:unitsplit.getCreditSplits()){
                        if((invcrdtype.getInvCreditTypeCode().equals(unitcreditsplit.getInvCreditTypeCode()))){
                            creditTypeFound = true;
                            break;
                        }
                    }
                    if (!creditTypeFound ) {
                        ProposalUnitCreditSplit creditSplit = new ProposalUnitCreditSplit();
                        creditSplit.setProposalPerson(person);
                        creditSplit.setInvCreditTypeCode(invcrdtype.getInvCreditTypeCode());
                        creditSplit.setCredit(new ScaleTwoDecimal(0));
                        unitsplit.getCreditSplits().add(creditSplit);
                    }
                }
            }

        }
    }

    /**
     * Populate investigators
     * 
     * @param document The <code>{@link ProposalDevelopmentDocument}</code> to populate
     * investigators on
     */
    public void populateInvestigators(ProposalDevelopmentDocument document) {
        // Populate Investigators from a proposal document's persons
        LOG.debug("Populating Investigators");
        LOG.debug("Clearing investigator list");
        document.getDevelopmentProposal().getInvestigators().clear();

        for (ProposalPerson person : document.getDevelopmentProposal().getProposalPersons()) {
            LOG.debug(person.getFullName() + " is " + person.isInvestigator());

            if (person.isInvestigator()) {
                LOG.info("Adding investigator " + person.getFullName());
                document.getDevelopmentProposal().getInvestigators().add(person);
            }
        }
    }
    
    public void addProposalPerson(ProposalPerson proposalPerson, ProposalDevelopmentDocument document) {
    	getPersonEditableService().populateContactFields(proposalPerson);
        document.getDevelopmentProposal().addProposalPerson(proposalPerson);
        
        LOG.info("Added Proposal Person with proposalNumber = " + document.getDevelopmentProposal().getProposalNumber() + " and proposalPersonNumber = " + proposalPerson.getProposalPersonNumber());
        // handle lead unit for investigators respective to coi or pi
        if (proposalPerson.isPrincipalInvestigator()) {
            assignLeadUnit(proposalPerson, document.getDevelopmentProposal().getOwnedByUnitNumber());
        } else {
            // Lead Unit information needs to be removed in case the person used to be a PI
            ProposalPersonUnit unit = proposalPerson.getUnit(document.getDevelopmentProposal().getOwnedByUnitNumber());
            if (unit != null) {
                unit.setLeadUnit(false);
            }                
        }
        if(proposalPerson.getHomeUnit()!=null){
            String divisionName = getProposalPersonService().getProposalPersonDivisionName(proposalPerson);
            proposalPerson.setDivision(divisionName);
        }
        else
        {   
            proposalPerson.setDivision(ROLODEX_PERSON);
        } 
        if (proposalPerson.getProposalPersonRoleId().equals(PRINCIPAL_INVESTIGATOR_ROLE) || proposalPerson.getProposalPersonRoleId().equals(CO_INVESTIGATOR_ROLE)) {
            if (isNotBlank(proposalPerson.getHomeUnit()) && isValidHomeUnit(proposalPerson, proposalPerson.getHomeUnit())){
                addUnitToPerson(proposalPerson,createProposalPersonUnit(proposalPerson.getHomeUnit(), proposalPerson));
            }
        }
        
        populateProposalPerson(proposalPerson, document);
    }
    
    /**
     * Determines whether the person has valid unit
     * 
     * @param person
     * @return boolean
     */
    @SuppressWarnings("unchecked")
    public boolean isValidHomeUnit(ProposalPerson person, String unitId){
        Map valueMap = new HashMap();
        valueMap.put("unitNumber", unitId);
        Collection<Unit> units = getBusinessObjectService().findMatching(Unit.class, valueMap);
        
        return CollectionUtils.isNotEmpty(units);
    }

    @Override
    public void populateProposalPerson(ProposalPerson person, ProposalDevelopmentDocument document) {
        /* populate certification questions for new person */
        person = getYnqService().getPersonYNQ(person, document);

        if (person.isInvestigator()) {
            if (!document.getDevelopmentProposal().getInvestigators().contains(person)) {
                document.getDevelopmentProposal().getInvestigators().add(person);
            }
            populateCreditTypes(person);
        }

        person.setRoleChanged(false);

        try {
            if (person.getPersonId() != null 
                    && person.getPerson().getExtendedAttributes() != null) {
                KcPerson origPerson = person.getPerson();
                for (PersonDegree degree : origPerson.getExtendedAttributes().getPersonDegrees()) {
                    ProposalPersonDegree newDegree = new ProposalPersonDegree();
                    newDegree.setDegree(degree.getDegree());
                    newDegree.setDegreeCode(degree.getDegreeCode());
                    newDegree.setFieldOfStudy(degree.getFieldOfStudy());
                    newDegree.setGraduationYear(degree.getGraduationYear());
                    newDegree.setSchool(degree.getSchool());
                    newDegree.setSchoolId(degree.getSchoolId());
                    newDegree.setSchoolIdCode(degree.getSchoolIdCode());
                    newDegree.setDegreeSequenceNumber(document.getDocumentNextValue(Constants.PROPOSAL_PERSON_DEGREE_SEQUENCE_NUMBER));
                    person.addDegree(newDegree);                
                }
                if (origPerson.getExtendedAttributes().getAttachments() != null) {
                    for (PersonBiosketch attachment : origPerson.getExtendedAttributes().getAttachments()) {
                        ProposalPersonBiography bio = new ProposalPersonBiography();
                        bio.setProposalPersonNumber(person.getProposalPersonNumber());
                        bio.setDocumentTypeCode(getDefaultPersonAttachmentDocType());
                        bio.setDescription(attachment.getDescription());
                        bio.setName(attachment.getFileName());
                        bio.setType(attachment.getContentType());
                        
                        ProposalPersonBiographyAttachment personnelAttachment = new ProposalPersonBiographyAttachment();
                        personnelAttachment.setName(attachment.getFileName());
                        personnelAttachment.setProposalNumber(document.getDevelopmentProposal().getProposalNumber());
                        personnelAttachment.setProposalPersonNumber(person.getProposalPersonNumber());
                        personnelAttachment.setData(attachment.getAttachmentContent());
                        personnelAttachment.setType(attachment.getContentType());
                        bio.setPersonnelAttachment(personnelAttachment);

                        document.getDevelopmentProposal().addProposalPersonBiography(bio);
                    }
                }
            }
        } catch (IllegalArgumentException e) {
            //catching the possibility that person.getPerson can not
            //find a EntityContract for this person id.
        }
    }

    /**
     * Initializes credit splits for new investigators
     * 
     * @param person
     */
    protected void populateCreditTypes(ProposalPerson person) {
        if (!person.getCreditSplits().isEmpty()) {
            return;
        }

        for (InvestigatorCreditType creditType : (Collection<InvestigatorCreditType>) getInvestigatorCreditTypes()) {
            ProposalPersonCreditSplit creditSplit = new ProposalPersonCreditSplit();
            creditSplit.setProposalPerson(person);
            creditSplit.setInvCreditTypeCode(creditType.getInvCreditTypeCode());
            creditSplit.setCredit(new ScaleTwoDecimal(0));
            person.getCreditSplits().add(creditSplit);
        }

    }

    /**
     * Queries persistent storage for a <code>{@link Collection}</code> of <code>{@link InvestigatorCreditType}</code>
     * instances.
     * 
     * @return Collection<InvestigatorCreditType> of active credit types
     */
    public Collection<InvestigatorCreditType> getInvestigatorCreditTypes() {
        Map<String,String> valueMap = new HashMap<String, String>();
        BusinessObjectService bos =getBusinessObjectService();
        valueMap.put("active", "true");
        return bos.findMatching(InvestigatorCreditType.class, valueMap);
    }

    /**
     * Queries persistent storage for a <code>{@link Collection}</code> of <code>{@link InvestigatorCreditType}</code>
     * instances.
     * 
     * @return Collection<InvestigatorCreditType> of all credit types
     */
    public Collection<InvestigatorCreditType> getAllInvestigatorCreditTypes() {
        return getBusinessObjectService().findAll(InvestigatorCreditType.class);
    }



    /**
     * Queries persistent storage for a <code>{@link Collection}</code> of <code>{@link Ynq}</code>
     * instances.
     * 
     * @return Collection<Ynq>
     */
    public Collection<Ynq> getYesNoQuestions() {
        return getBusinessObjectService().findAll(Ynq.class);
    }

    /**
     * Everytime something changes that will effect credit split values, this gets called to generate a graph of the
     * new data.
     *
     * @param document
     * @return Map
     */
    public Map calculateCreditSplitTotals(ProposalDevelopmentDocument document) {
        Map<String, Map<String,ScaleTwoDecimal>> retval = new HashMap<String,Map<String,ScaleTwoDecimal>>();

        // Initialize investigator credit types if there aren't any
        if (document.getDevelopmentProposal().getInvestigatorCreditTypes() == null || document.getDevelopmentProposal().getInvestigatorCreditTypes().size() == 0) {
            document.getDevelopmentProposal().setInvestigatorCreditTypes(getInvestigatorCreditTypes());
        }

        Collection<InvestigatorCreditType> creditTypes = document.getDevelopmentProposal().getInvestigatorCreditTypes();

        for (ProposalPerson investigator : document.getDevelopmentProposal().getInvestigators()) {
            Map<String,ScaleTwoDecimal> creditTypeTotals = retval.get(investigator.getProposalPersonNumber().toString());
            Map<String,ScaleTwoDecimal> investigatorCreditTypeTotals = retval.get(PROPOSAL_PERSON_INVESTIGATOR);

            if (creditTypeTotals == null) {
                creditTypeTotals = new HashMap<String,ScaleTwoDecimal>();
                retval.put(investigator.getProposalPersonNumber().toString(), creditTypeTotals);
            }
            if (investigatorCreditTypeTotals == null) {
                investigatorCreditTypeTotals = new HashMap<String,ScaleTwoDecimal>();
                retval.put(PROPOSAL_PERSON_INVESTIGATOR, investigatorCreditTypeTotals);
            }

            // Initialize everything to zero
            for (InvestigatorCreditType creditType : creditTypes) {                
                ScaleTwoDecimal totalCredit = creditTypeTotals.get(creditType.getInvCreditTypeCode());

                if (totalCredit == null) {
                    totalCredit = new ScaleTwoDecimal(0);
                    creditTypeTotals.put(creditType.getInvCreditTypeCode(), totalCredit);
                }
                ScaleTwoDecimal investigatorTotalCredit = investigatorCreditTypeTotals.get(creditType.getInvCreditTypeCode());

                if (investigatorTotalCredit == null) {
                    investigatorTotalCredit = new ScaleTwoDecimal(0);
                    investigatorCreditTypeTotals.put(creditType.getInvCreditTypeCode(), investigatorTotalCredit);
                }
                // set investigator credit total 
                for (CreditSplit creditSplit : investigator.getCreditSplits()) {
                    if (creditSplit.getInvCreditTypeCode().equals(creditType.getInvCreditTypeCode())) {
                        investigatorCreditTypeTotals.put(creditType.getInvCreditTypeCode(), investigatorTotalCredit.add(creditSplit.getCredit()));
                    }
                }
            }

            for (ProposalPersonUnit unit : investigator.getUnits()) {
                for (CreditSplit creditSplit : unit.getCreditSplits()) {
                    ScaleTwoDecimal totalCredit = creditTypeTotals.get(creditSplit.getInvCreditTypeCode());

                    if (totalCredit == null) {
                        totalCredit = new ScaleTwoDecimal(0);
                        creditTypeTotals.put(creditSplit.getInvCreditTypeCode(), totalCredit);
                    }
                    creditTypeTotals.put(creditSplit.getInvCreditTypeCode(),totalCredit.add(creditSplit.getCredit()));
                }
            }
        }

        return retval;
    }

    /**
     * Retrieve the injected <code>{@link BusinessObjectService}</code>
     * 
     * @return businessObjectService
     */
    public BusinessObjectService getBusinessObjectService() {
        return businessObjectService;
    }

    /**
     * assign the <code>{@link BusinessObjectService}</code> to use.
     * 
     * @param boservice <code>{@link BusinessObjectService}</code> instance to assign
     */
    public void setBusinessObjectService(BusinessObjectService boservice) {
        businessObjectService = boservice;
    }

    @Override
    public void addUnitToPerson(ProposalPerson person, ProposalPersonUnit unit) {
        if (unit == null) {
            throw new IllegalArgumentException("Cannot add null units to a ProposalPerson instance");
        }

        if (!person.containsUnit(unit.getUnitNumber())) {
        	unit.setProposalPerson(person);

            person.addUnit(unit);
            unit.refreshReferenceObject("unit");
        }
    }

    /**
     * Assigns the lead unit of the proposal to the given principal investigator
     */
    public void assignLeadUnit(ProposalPerson person, String unitNumber) {
        if (person.containsUnit(unitNumber)) {
            person.getUnit(unitNumber).setLeadUnit(true);
            return;
        }

        ProposalPersonUnit unit = createProposalPersonUnit(unitNumber, person);
        unit.setLeadUnit(true);
        addUnitToPerson(person, unit);
    }

    /**
     * Uses a <code>{@link Unit}</code> obtained from the <code>{@link Unit}</code> lookup
     * to create a <code>{@link ProposalPersonUnit}</code> instance.
     *
     * @param unitId
     * @return ProposalPersonUnit
     */
    public ProposalPersonUnit createProposalPersonUnit(String unitId, ProposalPerson person) {
        ProposalPersonUnit retval = new ProposalPersonUnit();
        Map valueMap = new HashMap();
        valueMap.put("unitNumber", unitId);
        Collection<Unit> units = getBusinessObjectService().findMatching(Unit.class, valueMap);

        for (Unit found : units) {
            retval.setUnitNumber(found.getUnitNumber());
            retval.setUnit(found);
        }

        for (InvestigatorCreditType creditType : getInvestigatorCreditTypes()) {
            ProposalUnitCreditSplit creditSplit = new ProposalUnitCreditSplit();
            creditSplit.setProposalPerson(person);
            creditSplit.setUnitNumber(unitId);
            creditSplit.setInvCreditTypeCode(creditType.getInvCreditTypeCode());
            creditSplit.setCredit(new ScaleTwoDecimal(0));
            retval.getCreditSplits().add(creditSplit);
        }

        return retval;        
    }

    /**
     * Accessor method for dependency injection
     * 
     * @param ynqService
     */
    public void setYnqService(YnqService ynqService) {
        this.ynqService = ynqService;
    }

    public YnqService getYnqService() {
        return ynqService;
    }

    /**
     * Uses the {@link ParameterService} to determine if the application-level configuration parameter is enabled
     *
     * @see KeyPersonnelService#isCreditSplitEnabled()
     */
    public boolean isCreditSplitEnabled() {
        return getParameterService().getParameterValueAsBoolean(ProposalDevelopmentDocument.class, CREDIT_SPLIT_ENABLED_RULE_NAME);
    }
    
    public String getDefaultPersonAttachmentDocType() {
        return getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, PROPOSAL_PERSON_BIOGRAPHY_DEFAULT_DOC_TYPE);
    }

    /**
     * Sets the ParameterService.
     * @param parameterService the parameter service.
     */
    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }
    protected ParameterService getParameterService (){return parameterService;}

    protected SponsorHierarchyService getSponsorHierarchyService() {
        return sponsorHierarchyService;
    }
    
    protected boolean hasBeenRoutedOrCanceled(ProposalDevelopmentDocument document) {
        WorkflowDocument workflowDoc = document.getDocumentHeader().getWorkflowDocument();
        return !workflowDoc.isInitiated() && !workflowDoc.isSaved();
    }
    
    public void setSponsorHierarchyService(SponsorHierarchyService sponsorHierarchyService) {
        this.sponsorHierarchyService = sponsorHierarchyService;
    }
	protected PersonEditableService getPersonEditableService() {
		return personEditableService;
	}
	public void setPersonEditableService(PersonEditableService personEditableService) {
		this.personEditableService = personEditableService;
	}
}
