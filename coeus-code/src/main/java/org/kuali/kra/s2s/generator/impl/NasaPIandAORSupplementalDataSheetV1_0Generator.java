/*
 * Copyright 2005-2014 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.s2s.generator.impl;

import gov.grants.apply.forms.nasaPIandAORSupplementalDataSheetV10.FederalAgencyDataType;
import gov.grants.apply.forms.nasaPIandAORSupplementalDataSheetV10.NasaPIandAORSupplementalDataSheetDocument;
import gov.grants.apply.forms.nasaPIandAORSupplementalDataSheetV10.NasaPIandAORSupplementalDataSheetDocument.NasaPIandAORSupplementalDataSheet;
import gov.grants.apply.forms.nasaPIandAORSupplementalDataSheetV10.NasaPIandAORSupplementalDataSheetDocument.NasaPIandAORSupplementalDataSheet.AuthorizedRepresentativeName;
import gov.grants.apply.forms.nasaPIandAORSupplementalDataSheetV10.NasaPIandAORSupplementalDataSheetDocument.NasaPIandAORSupplementalDataSheet.PrincipalInvestigatorName;
import gov.grants.apply.system.globalLibraryV20.HumanNameDataType;
import gov.grants.apply.system.globalLibraryV20.YesNoDataType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.common.api.question.AnswerContract;
import org.kuali.coeus.common.api.question.AnswerHeaderContract;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;
import org.kuali.kra.s2s.generator.bo.DepartmentalPerson;
import org.kuali.kra.s2s.service.S2SUtilService;
import org.kuali.kra.s2s.util.S2SConstants;

import java.math.BigDecimal;
import java.util.List;

/**
 * 
 * This class is used to generate XML Document object for grants.gov
 * NasaPIandAORSupplementalDataSheetV1.0. This form is generated using XMLBean
 * API's generated by compiling NasaPIandAORSupplementalDataSheetV1.0 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class NasaPIandAORSupplementalDataSheetV1_0Generator extends
		S2SBaseFormGenerator {
	private static final Log LOG = LogFactory
			.getLog(NasaPIandAORSupplementalDataSheetV1_0Generator.class);
	private S2SUtilService s2sUtilService;

	private static final String PI_PROPOSAL_YNQ_INTERNATIONAL_PARTICIPATION = "112";
	private static final String PI_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION_AMOUNT = "113";
	private static final String PI_SUB_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION_AMOUNT = "111";
	private static final String PI_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION = "110";
	private static final String NOT_ANSWERED = "No";
	List<? extends AnswerHeaderContract> answerHeaders ;
	
	/**
	 * 
	 * Constructs a NasaPIandAORSupplementalDataSheetV1_0Generator.java.
	 */
	public NasaPIandAORSupplementalDataSheetV1_0Generator() {
		s2sUtilService = KcServiceLocator.getService(S2SUtilService.class);
	}

	/**
	 * 
	 * This method returns NasaPIandAORSupplementalDataSheetDocument object
	 * based on proposal development document which contains the
	 * NasaPIandAORSupplementalDataSheetDocument informations
	 * AuthorizedRepresentativeName, PrincipalInvestigatorName for a particular
	 * proposal
	 * 
	 * @return nasaPIandAORSupplementalDataSheetDocument {@link XmlObject} of
	 *         type NasaPIandAORSupplementalDataSheetDocument.
	 */
	private NasaPIandAORSupplementalDataSheetDocument getnasapIandAORSupplementalDataSheetDocument() {
		NasaPIandAORSupplementalDataSheetDocument nasaPIandAORSupplementalDataSheetDocument = NasaPIandAORSupplementalDataSheetDocument.Factory
				.newInstance();
		NasaPIandAORSupplementalDataSheet nasapIandAORSupplementalDataSheet = NasaPIandAORSupplementalDataSheet.Factory
				.newInstance();
		nasapIandAORSupplementalDataSheet
				.setFormVersion(S2SConstants.FORMVERSION_1_0);

		nasapIandAORSupplementalDataSheet
				.setAuthorizedRepresentativeName(getAuthorizedRep());
		nasapIandAORSupplementalDataSheet
				.setPrincipalInvestigatorName(getPrincipalInvestigator());

		nasaPIandAORSupplementalDataSheetDocument
				.setNasaPIandAORSupplementalDataSheet(nasapIandAORSupplementalDataSheet);
		return nasaPIandAORSupplementalDataSheetDocument;
	}

	/**
	 * 
	 * This method returns authorizedRepresentativeName which contains
	 * AORName,UserName
	 * 
	 * @return AuthorizedRepresentativeName object with AORname and user name
	 *         details.
	 */
	private AuthorizedRepresentativeName getAuthorizedRep() {
		AuthorizedRepresentativeName authorizedRepresentativeName = AuthorizedRepresentativeName.Factory
				.newInstance();

		DepartmentalPerson aorInfo = s2sUtilService.getDepartmentalPerson(pdDoc);
		authorizedRepresentativeName.setAORName(globLibV20Generator.getHumanNameDataType(aorInfo));

		// TODO HardCoded because table EPS_PROP_CUSTOM_DATA was not found in
		// database
		// authorizedRepresentativeName.setUserName("");
		return authorizedRepresentativeName;
	}

	/**
	 * 
	 * This method returns principalInvestigatorName which contains
	 * PDPIName,USGovernmentParticipation,
	 * FederalAgency,FederalAgencyDollar,InternationalParticipation.
	 * 
	 * @return principalInvestigatorName (PrincipalInvestigatorName) object
	 *         containing principal investigator details.
	 */
	private PrincipalInvestigatorName getPrincipalInvestigator() {
		PrincipalInvestigatorName principalInvestigatorName = PrincipalInvestigatorName.Factory
				.newInstance();

		ProposalPerson PI = s2sUtilService.getPrincipalInvestigator(pdDoc);
		if (PI != null) {
			principalInvestigatorName.setPDPIName(globLibV20Generator
					.getHumanNameDataType(PI));
		} else {
			principalInvestigatorName.setPDPIName(HumanNameDataType.Factory
					.newInstance());
		}

		answerHeaders = getPropDevQuestionAnswerService().getQuestionnaireAnswerHeaders(pdDoc.getDevelopmentProposal().getProposalNumber());
	    for (AnswerHeaderContract answerHeader : answerHeaders){
	        for (AnswerContract answers : answerHeader.getAnswers()) {
                if (answers.getQuestionId() != null
	                    && getQuestionAnswerService().findQuestionById(answers.getQuestionId()).getQuestionSeqId().equals(
	                            PI_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION)){
	                String explanation = null;
	                if(answers.getAnswer() != null ){
	                    if(!answers.getAnswer().equals(NOT_ANSWERED)){
	                       String  answer = answers.getAnswer();
	                        if ((getAnswer(PI_SUB_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION_AMOUNT, answerHeaders)) != null ){
	                            explanation = getAnswer(PI_SUB_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION_AMOUNT, answerHeaders);
	                        }
	                        if (answer != null) {
	                            if (answer.equals(S2SConstants.PROPOSAL_YNQ_ANSWER_Y)) {
	                                principalInvestigatorName
	                                    .setUSGovernmentParticipation(YesNoDataType.Y_YES);
	                                FederalAgencyDataType.Enum FederalAgencyEnum = getFederalAgency(explanation);
	                                principalInvestigatorName.setFederalAgency(FederalAgencyEnum);
	                                final String amnt = getAnswer(PI_PROPOSAL_YNQ_US_GOVERNMENT_PARTICIPATION_AMOUNT, answerHeaders);
                                    principalInvestigatorName
	                                    .setFederalAgencyDollar(amnt != null ? new BigDecimal(Integer.valueOf(amnt)) : null);
	                            } else if (answer
	                                    .equals(S2SConstants.PROPOSAL_YNQ_ANSWER_N)) {
	                                principalInvestigatorName
	                                .setUSGovernmentParticipation(YesNoDataType.N_NO);
	                            }
	                        }
	                    }
	                }
	            }
	        }    
	    }    
	    for (AnswerHeaderContract answerHeader : answerHeaders){
            for (AnswerContract answers : answerHeader.getAnswers()) {
                if (answers.getQuestionId() != null
                        && getQuestionAnswerService().findQuestionById(answers.getQuestionId()).getQuestionSeqId().equals(
                                PI_PROPOSAL_YNQ_INTERNATIONAL_PARTICIPATION)) {
                    if(answers.getAnswer() != null ){
                        if(!answers.getAnswer().equals(NOT_ANSWERED)){
                            String answer = answers.getAnswer();
                                if (answer != null) {
                                    if (answer.equals(S2SConstants.PROPOSAL_YNQ_ANSWER_Y)) {
                                        principalInvestigatorName
                                        .setInternationalParticipation(YesNoDataType.Y_YES);
                                        break;
                                    } else if (answer
                                            .equals(S2SConstants.PROPOSAL_YNQ_ANSWER_N)) {
                                        principalInvestigatorName
                                        .setInternationalParticipation(YesNoDataType.N_NO);
                                        break;
                                    }
                                }
                                break;
                        }
                    }
                }   
            }   
	    }
		return principalInvestigatorName;
	}

	private FederalAgencyDataType.Enum getFederalAgency(String explanation) {
		FederalAgencyDataType.Enum FederalAgencyEnum = null;
		if (explanation != null) {
			try {
				// Explanation should be Federal Agency Code ranging from
				int federalAgencyCode = Integer.parseInt(explanation);
				if (federalAgencyCode > 99 && federalAgencyCode < 151) {
					FederalAgencyEnum = FederalAgencyDataType.Enum
							.forInt(federalAgencyCode - 100);
				}
			} catch (NumberFormatException e) {
				// Explanation entered is not a number. Federal Agency cannot be
				// set.
				LOG.warn(
						"Comments entered should be number between 101 to 150",
						e);
			}
		}
		return FederalAgencyEnum;
	}

	/**
	 * This method creates {@link XmlObject} of type
	 * {@link NasaPIandAORSupplementalDataSheetDocument} by populating data from
	 * the given {@link ProposalDevelopmentDocument}
	 * 
	 * @param proposalDevelopmentDocument
	 *            for which the {@link XmlObject} needs to be created
	 * @return {@link XmlObject} which is generated using the given
	 *         {@link ProposalDevelopmentDocument}
	 * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
	 */
	public XmlObject getFormObject(
			ProposalDevelopmentDocument proposalDevelopmentDocument) {
		this.pdDoc = proposalDevelopmentDocument;
		return getnasapIandAORSupplementalDataSheetDocument();
	}

}
