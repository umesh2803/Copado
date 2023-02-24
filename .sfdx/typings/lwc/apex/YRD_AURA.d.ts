declare module "@salesforce/apex/YRD_AURA.GetList" {
  export default function GetList(): Promise<any>;
}
declare module "@salesforce/apex/YRD_AURA.getPolicy" {
  export default function getPolicy(param: {clientId: any, Fromdate: any, Todate: any, FromRecordId: any}): Promise<any>;
}
declare module "@salesforce/apex/YRD_AURA.gettotalpolicy" {
  export default function gettotalpolicy(param: {Accountid: any}): Promise<any>;
}
declare module "@salesforce/apex/YRD_AURA.getmilestone" {
  export default function getmilestone(param: {policyid: any, premium: any, renewal: any}): Promise<any>;
}
declare module "@salesforce/apex/YRD_AURA.milestoneinsert" {
  export default function milestoneinsert(param: {policyid: any, premium: any, renewal: any, insuranceid: any}): Promise<any>;
}
