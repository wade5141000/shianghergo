package testhibernate;

//@Controller
//public class Practice {

//	public static void main(String[] args) {
	
//		Session session = HibernateUtils.openSession();
//		Transaction tx = session.beginTransaction();
//		tx.commit();
//		session.close();
		
//	}
	
//	@RequestMapping("testimg")
//	public String imaage(@RequestParam("idPic") MultipartFile img) {
//		if(!img.isEmpty()) {
//			System.out.println("有東西");
//		}
		
//		GeoApiContext context = new GeoApiContext.Builder().apiKey("AIza...").build();
//			GeocodingResult[] results = null;
//			try {
//				results = GeocodingApi.geocode(context,
//				    "1600 Amphitheatre Parkway Mountain View, CA 94043").await();
//			} catch (ApiException e) {
//				e.printStackTrace();
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			Gson gson = new GsonBuilder().setPrettyPrinting().create();
//			System.out.println(gson.toJson(results[0].addressComponents));
//		
//		return "index";
//	}
//	
//	
//}
