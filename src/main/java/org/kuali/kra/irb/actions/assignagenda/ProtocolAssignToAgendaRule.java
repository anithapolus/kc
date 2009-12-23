/*
 * Copyright 2006-2008 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
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
package org.kuali.kra.irb.actions.assignagenda;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.irb.ProtocolDocument;
import org.kuali.kra.irb.actions.assigncmtsched.ExecuteProtocolAssignCmtSchedRule;
import org.kuali.kra.irb.actions.assigncmtsched.ProtocolAssignCmtSchedBean;
import org.kuali.kra.rules.ResearchDocumentRuleBase;
import org.kuali.rice.kns.util.GlobalVariables;

/**
 * Validate the assignment of a protocol to a agenda.
 */
public class ProtocolAssignToAgendaRule extends ResearchDocumentRuleBase implements ExecuteProtocolAssignToAgendaRule {
   
    /**
     * Verify that a committee has been selected.
     * @see org.kuali.kra.irb.actions.assignagenda.ExecuteProtocolAssignToAgendaRule#processAssignToCommitteeSchedule(org.kuali.kra.irb.ProtocolDocument, org.kuali.kra.irb.actions.assignagenda.ProtocolAssignToAgendaBean)
     */
    @SuppressWarnings("deprecation")    
    public boolean processAssignToAgendaRule(ProtocolDocument document, ProtocolAssignToAgendaBean actionBean) {
        boolean valid = true;
        if (StringUtils.isBlank(actionBean.getCommitteeId())) {
            valid = false;
            GlobalVariables.getErrorMap().putError(Constants.PROTOCOL_ASSIGN_TO_AGENDA_PROPERTY_KEY + ".committeeId", 
                                                   KeyConstants.ERROR_PROTOCOL_COMMITTEE_NOT_SELECTED);
        }
        return valid;
    }
}
