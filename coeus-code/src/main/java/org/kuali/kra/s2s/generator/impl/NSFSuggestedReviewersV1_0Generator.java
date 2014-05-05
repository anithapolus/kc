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

import gov.grants.apply.forms.nsfSuggestedReviewersV10.NSFSuggestedReviewersDocument;
import gov.grants.apply.forms.nsfSuggestedReviewersV10.NSFSuggestedReviewersDocument.NSFSuggestedReviewers;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.kra.s2s.util.S2SConstants;

/**
 * 
 * This class is used to generate XML Document object for grants.gov NSFSuggestedReviewersV1.0. This form is generated using XMLBean
 * API's generated by compiling NSFSuggestedReviewersV1.0 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
public class NSFSuggestedReviewersV1_0Generator extends NSFSuggestedReviewersBaseGenerator {


    /**
     * 
     * This method returns NSFSuggestedReviewersDocument object based on proposal development document which contains the
     * NSFSuggestedReviewersDocument informations SuggestedReviewers and inclusion of Reviewer for a particular proposal
     * 
     * @return nsfReviewersDocument {@link XmlObject} of type NSFSuggestedReviewersDocument.
     */
    private NSFSuggestedReviewersDocument getNSFSuggestedReviewers() {

        NSFSuggestedReviewersDocument nsfReviewersDocument = NSFSuggestedReviewersDocument.Factory.newInstance();
        NSFSuggestedReviewers nsfSuggestedReviewers = NSFSuggestedReviewers.Factory.newInstance();
        nsfSuggestedReviewers.setFormVersion(S2SConstants.FORMVERSION_1_0);
        String suggestedRev = getAbstractText(SUGGESTED_REVIEWERS);
        if (suggestedRev != null && !suggestedRev.equals("")) {
            nsfSuggestedReviewers.setSuggestedReviewers(suggestedRev);
        }
        String doNotInclude = getAbstractText(REVIEWERS_NOT_TO_INCLUDE);
        if (doNotInclude != null && !doNotInclude.equals("")) {
            nsfSuggestedReviewers.setReviewersNotToInclude(doNotInclude);
        }
        nsfReviewersDocument.setNSFSuggestedReviewers(nsfSuggestedReviewers);
        return nsfReviewersDocument;
    }

    /**
     * This method creates {@link XmlObject} of type {@link NSFSuggestedReviewersDocument} by populating data from the given
     * {@link ProposalDevelopmentDocument}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocument}
     * @see org.kuali.kra.s2s.generator.S2SFormGenerator#getFormObject(ProposalDevelopmentDocument)
     */
    public XmlObject getFormObject(ProposalDevelopmentDocument proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        return getNSFSuggestedReviewers();
    }
}
