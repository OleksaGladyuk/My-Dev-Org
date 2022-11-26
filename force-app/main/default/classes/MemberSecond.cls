public with sharing class MemberSecond {
    private static final String jsonMembers = '{\n' +
    '  "squadName": "Super hero squad",\n' +
    '  "homeTown": "Metro City",\n' +
    '  "formed": 2016,\n' +
    '  "secretBase": "Super tower",\n' +
    '  "active": true,\n' +
    '  "members": [\n' +
    '    {\n' +
    '      "name": "Molecule Man",\n' +
    '      "age": 29,\n' +
    '      "secretIdentity": "Dan Jukes",\n' +
    '      "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]\n' +
    '    },\n' +
    '    {\n' +
    '      "name": "Madame Uppercut",\n' +
    '      "age": 39,\n' +
    '      "secretIdentity": "Jane Wilson",\n' +
    '      "powers": [\n' +
    '        "Million tonne punch",\n' +
    '        "Damage resistance",\n' +
    '        "Superhuman reflexes"\n' +
    '      ]\n' +
    '    },\n' +
    '    {\n' +
    '      "name": "Eternal Flame",\n' +
    '      "age": 1000000,\n' +
    '      "secretIdentity": "Unknown",\n' +
    '      "powers": [\n' +
    '        "Immortality",\n' +
    '        "Heat Immunity",\n' +
    '        "Inferno",\n' +
    '        "Teleportation",\n' +
    '        "Interdimensional travel"\n' +
    '      ]\n' +
    '    }\n' +
    '  ]\n' +
    '}';

    public static List<MemberWrapper> getMembers(){
        //TODO: 
        // 1. Create Apex Class (add code to lines )
        // 2. Parse JSON string from line 3 using Object, Map, List etc
        // 3. Create List<MemberWrapper> and store the result from json
        // 4. return List
        // 5. Test the logic using anonymous apex window in dev console
        
        Map<String, Object> members = (Map<String, Object>)JSON.deserializeUntyped(jsonMembers);
        
		List<MemberWrapper> memberWrappers = new List<MemberWrapper>();
        		
		List<Object> myMapObjects = (List<Object>) members.get('members');
        
		for (Object member : myMapObjects) {
        	String memberJson = JSON.serialize(member);
        	MemberWrapper memberWrapper = (MemberWrapper) JSON.deserialize(memberJson, MemberWrapper.class);
                        
    		memberWrappers.add(memberWrapper);
                        
		}
        
        return memberWrappers;
        
        
     }

    public class MemberWrapper{

   
       public String name;
       public Integer age;
       public String secretIdentity;
       public String[] powers;
       

     }
}