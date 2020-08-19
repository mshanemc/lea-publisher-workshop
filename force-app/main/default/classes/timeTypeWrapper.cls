public with sharing class timeTypeWrapper {
  @invocableMethod
  public static list<Hours__c> StringToTime(
    list<AddTimesToHoursRequest> inputs
  ) {
    list<Hours__c> output = new List<Hours__c>();

    for (AddTimesToHoursRequest input : inputs) {
      Hours__c hours = input.Hours;
      hours.Open__c = stringToTimeConverter(input.StartTimeString);
      hours.Close__c = stringToTimeConverter(input.CloseTimeString);
      output.add(hours);
    }

    return output;
  }

  private static Time stringToTimeConverter(string input) {
    list<string> splits = input.split(':');
    return Time.newInstance(
      integer.valueOf(splits[0]),
      integer.valueOf(splits[1]),
      0,
      0
    );
  }

  public class AddTimesToHoursRequest {
    @invocableVariable(required=true label='Existing Hours Object')
    public Hours__c Hours;

    @invocableVariable(required=true)
    public string StartTimeString;

    @invocableVariable(required=true)
    public string CloseTimeString;
  }
}
