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
package org.kuali.kra.irb.bo;

import java.util.LinkedHashMap;

import org.kuali.kra.bo.KraPersistableBusinessObjectBase;

@SuppressWarnings("serial")
public class ExemptStudiesCheckListItem extends KraPersistableBusinessObjectBase {

    private String exemptStudiesCheckListCode;
    private String description;
    private transient boolean checked = false;
    
    public ExemptStudiesCheckListItem() {
        
    }

    public String getExemptStudiesCheckListCode() {
        return exemptStudiesCheckListCode;
    }

    public void setExemptStudiesCheckListCode(String exemptStudiesCheckListCode) {
        this.exemptStudiesCheckListCode = exemptStudiesCheckListCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setChecked(boolean checked) {
        this.checked = checked;
    }
    
    public boolean getChecked() {
        return checked;
    }
    
    /**
     * This is only used by JSP to obtain an abbreviated check list description.
     * For descriptions are much too long and we can't display the entire text.
     * @return the abbreviated description
     */
    public String getAbbrevDescription() {
        if (description.length() < ExpeditedReviewCheckListItem.ABBREV_LENGTH) {
            return description;
        }
        else {
            return description.substring(0, ExpeditedReviewCheckListItem.ABBREV_LENGTH) + "...";
        }
    }
    
    @SuppressWarnings("unchecked")
    @Override
    protected LinkedHashMap toStringMapper() {
        LinkedHashMap map = new LinkedHashMap();
        map.put("exemptStudiesCheckListCode", getExemptStudiesCheckListCode());
        map.put("description", getDescription());
        map.put("checked", getChecked());
        return map;
    }
}
