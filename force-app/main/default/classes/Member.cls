public with sharing class Member {

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

    public static List<Object> getMembers(){
        //TODO: 
        // 1. Create Apex Class (add code to lines )
        // 2. Parse JSON string from line 3 using Object, Map, List etc
        // 3. Create List<MemberWrapper> and store the result from json
        // 4. return List
        // 5. Test the logic using anonymous apex window in dev console

        List<Object> members = (List<Object>)JSON.deserializeUntyped(jsonMembers);
        system.debug(members);

        List<MemberWrapper> mwList = new List<MemberWrapper>();

        for (Object member : members) {
            Map<String, Object> membersFields = (Map<String, Object>)member;

            MemberWrapper mw = new MemberWrapper();
            mw.squadName = (String)membersFields.get('squadName');
            mw.homeTown = (String)membersFields.get('homeTown');
            mw.formed = (Integer)membersFields.get('formed');
            mw.secretBase = (String)membersFields.get('secretBase');
            mw.active = (Boolean)membersFields.get('active');
            mw.name = (String)membersFields.get('name');
            mw.ege = (Integer)membersFields.get('ege');
            mw.secretIdentity = (String)membersFields.get('secretIdentity');
            mw.powers = (String)membersFields.get('powers');
            mwList.add(mw);

        }
        System.debug(mwList);
        return mwList;

    }

    public class MemberWrapper{

       public String squadName;
        public String homeTown;
        public Integer formed;
        public String secretBase;
        public Boolean active;
        public String name;
        public Integer ege;
        public String secretIdentity;
        public String powers;
    }

}
