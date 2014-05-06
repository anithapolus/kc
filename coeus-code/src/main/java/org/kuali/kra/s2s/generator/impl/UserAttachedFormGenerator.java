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

import gov.grants.apply.forms.budgetV11.BudgetNarrativeAttachmentsDocument;
import gov.grants.apply.forms.budgetV11.BudgetNarrativeAttachmentsDocument.BudgetNarrativeAttachments;
import org.apache.xmlbeans.XmlException;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.coeus.propdev.api.s2s.S2sUserAttachedFormAttContract;
import org.kuali.coeus.propdev.api.s2s.S2sUserAttachedFormContract;
import org.kuali.coeus.propdev.api.s2s.UserAttachedFormService;
import org.kuali.kra.s2s.generator.S2SBaseFormGenerator;
import org.kuali.kra.s2s.generator.bo.AttachmentData;

import java.util.Iterator;
import java.util.List;

/**
 * 
 * This class is used to generate XML Document object for grants.gov BudgetV1.1. This form is generated using XMLBean API's
 * generated by compiling BudgetV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class UserAttachedFormGenerator extends S2SBaseFormGenerator {


    /**
     * This method creates {@link XmlObject} of type {@link BudgetNarrativeAttachmentsDocument} by populating data from the given
     * {@link ProposalDevelopmentDocument}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocument}
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
     * 
     */
    public XmlObject getFormObject(ProposalDevelopmentDocument proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        S2sUserAttachedFormContract userAttachedForm = findUserAttachedForm();
        String formXml = userAttachedForm.getXmlFile();
        XmlObject xmlObject;
        try {
            xmlObject = XmlObject.Factory.parse(formXml);
        }catch (XmlException e) {
            throw new RuntimeException("XmlObject not ready");
        }
        List<? extends S2sUserAttachedFormAttContract> attachments = userAttachedForm.getS2sUserAttachedFormAtts();
        for (Iterator iterator = attachments.iterator(); iterator.hasNext();) {
            S2sUserAttachedFormAttContract s2sUserAttachedFormAtt = (S2sUserAttachedFormAttContract) iterator.next();
            addAttachment(s2sUserAttachedFormAtt);
        }
        return xmlObject;
    }

    private void addAttachment(S2sUserAttachedFormAttContract s2sUserAttachedFormAtt) {
        AttachmentData attachmentData = new AttachmentData();
        attachmentData.setContent(s2sUserAttachedFormAtt.getData());
        attachmentData.setContentId(s2sUserAttachedFormAtt.getContentId());
        attachmentData.setContentType(s2sUserAttachedFormAtt.getType());
        attachmentData.setFileName(s2sUserAttachedFormAtt.getContentId());
        addAttachment(attachmentData);
    }

    private S2sUserAttachedFormContract findUserAttachedForm() {
        return  KcServiceLocator.getService(UserAttachedFormService.class).
                findFormByProposalNumberAndNamespace(pdDoc.getDevelopmentProposal().getProposalNumber(), getNamespace());
    }

    /**
     * This method type casts the given {@link XmlObject} to the required generator type and returns back the document of that
     * generator type.
     * 
     * @param xmlObject which needs to be converted to the document type of the required generator
     * @return {@link XmlObject} document of the required generator type
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(XmlObject)
     */
    public XmlObject getFormObject(XmlObject xmlObject) {
        BudgetNarrativeAttachmentsDocument budgetNarrativeAttachmentsDocument = BudgetNarrativeAttachmentsDocument.Factory
                .newInstance();
        BudgetNarrativeAttachments budgetNarrativeAttachments = (BudgetNarrativeAttachments) xmlObject;
        budgetNarrativeAttachmentsDocument.setBudgetNarrativeAttachments(budgetNarrativeAttachments);
        return budgetNarrativeAttachmentsDocument;
    }
}
