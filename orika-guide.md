# Orika mapping

### Mapping same objects without mapping nulls
`Request` object type <-> `Request` object type

For example we have a class Person
```
public class Request {
    private String pickupAddress;
    private String dropoffAddress;
    private String pickupTime;
    private String dropoffTime;
    private Person person;
    private PersonIdData id;
}

public class Person {
    private String name;
    private String surname;
    private int age;
    private Manifest manifest;
}

public class Manifest {
    private String currency;
    private String type;
    private List<Integer> items = new ArrayList<>();
}
```

#### Steps to perform Orika mapping
* Create Orika mapper facade which will have the configuration of the mapping. In order to map same objects without mapping null values, specify each nested object present in root object with mapNulls(false) and mapNullsInReverse(false).

  Request is root level object and Manifest is nested object inside Person class which is part of Request
  ```
  @Configuration
  public class OrikaConfig {
  
      @Bean
      public MapperFacade mapperFacadeBean(){
          final MapperFactory mapperFactory = new DefaultMapperFactory.Builder().build();
  
          mapperFactory
                  .classMap(QuoteRequest.class, QuoteRequest.class)
                  .mapNulls(false)
                  .mapNullsInReverse(false)
                  .byDefault()
                  .register();
  
          mapperFactory
                  .classMap(Manifest.class, Manifest.class)
                  .mapNulls(false)
                  .mapNullsInReverse(false)
                  .byDefault()
                  .register();
          mapperFactory
                  .classMap(Person.class, Person.class)
                  .mapNulls(false)
                  .mapNullsInReverse(false)
                  .byDefault()
                  .register();
  
          mapperFactory
                  .classMap(PersonIdData.class, PersonIdData.class)
                  .mapNulls(false)
                  .mapNullsInReverse(false)
                  .byDefault()
                  .register();
  
          return mapperFactory.getMapperFacade();
      }
  
  }
  

  ```
  
  ```
  Public class MyClass {
  
      @Autowired
      MapperFacade mapperFacade;
      
      public void myFunction() {
          final QuoteRequest request = new QuoteRequest();
          request.setPickupAddress("pickupaddress");
          request.setDropoffAddress("dropoffaddress");
          request.setPickupTime("pickuptime");
          request.setDropoffTime("dropofftime");
          request.setId(new PersonIdData("q1_id"));
          final Manifest manifest = new Manifest("USD", "imperial", Arrays.asList(1, 2, 3));
          request.setPerson(new Person("name", "surname", 10, manifest));
  
          final QuoteRequest response = new QuoteRequest();
          response.setId(new PersonIdData("q22222_id"));
          response.setPerson(new Person("responseName", "responseSurname", 1999, null));
  
          mapperFacade.map(response, request);
          System.out.println(request);
      }
  }

  ```
  Now when we map response on request, data from `response.person.manifest`, which is null, will not override manifest data present `request.person.manifest`, since we have specified mapNulls(false) and mapNullsInReverse(false) for all nested objects
  ```
  Result:
  
  QuoteRequest(pickupAddress=pickupaddress, dropoffAddress=dropoffaddress, pickupTime=pickuptime, dropoffTime=dropofftime, person=Person(name=responseName, surname=responseSurname, age=1999, manifest=Manifest(currency=USD, type=imperial, items=[1, 2, 3])), id=PersonIdData(id=q22222_id))

  ```