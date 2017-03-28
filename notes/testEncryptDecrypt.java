	@Test
	public void encryptPassword() throws Exception{
		String key1 = "k3vr1WA4M4H375dB";
		String ciPass = "password";
		String qaPass = "EXzDFP30fqRt8xbK";
		String stagePass = "1bPVYA9BIk7p10BP9";
		String prodPass = "pM2MMUYAYXCAKENt";
		String unitTestPass = "93lC3Mdn0j";
		String guestPass = "guest";

		System.out.println("\nci pass: " + ciPass);
		System.out.println("\nqa pass: " + qaPass);
		System.out.println("\nstage pass: " + stagePass);
		System.out.println("\nprod pass: " + prodPass);
		System.out.println("\nunittest pass: " + unitTestPass);
		System.out.println("\nguest pass: " + guestPass);

		EncryptDecryptTool tool = new EncryptDecryptTool(key1.getBytes());

		byte[] ciEncryptedBytes = tool.encrypt(ciPass.getBytes());
		byte[] qaEncryptedBytes = tool.encrypt(qaPass.getBytes());
		byte[] stageEncryptedBytes = tool.encrypt(stagePass.getBytes());
		byte[] prodEncryptedBytes = tool.encrypt(prodPass.getBytes());
		byte[] unitTestEncryptedBytes = tool.encrypt(unitTestPass.getBytes());
		byte[] guestEncryptedBytes = tool.encrypt(guestPass.getBytes());

		String base64ci = EncryptDecryptTool.garbageBytesToBase64(ciEncryptedBytes);
		String base64qa = EncryptDecryptTool.garbageBytesToBase64(qaEncryptedBytes);
		String base64stage = EncryptDecryptTool.garbageBytesToBase64(stageEncryptedBytes);
		String base64prod = EncryptDecryptTool.garbageBytesToBase64(prodEncryptedBytes);
		String base64unitTest = EncryptDecryptTool.garbageBytesToBase64(unitTestEncryptedBytes);
		String base64guest = EncryptDecryptTool.garbageBytesToBase64(guestEncryptedBytes);

		System.out.print("\nci pass:   " + base64ci);
		System.out.print("\nqa pass:   " + base64qa);
		System.out.print("\nstage pass:   " + base64stage);
		System.out.print("\nprod pass:   " + base64prod);
		System.out.print("\nunittest pass: " + base64unitTest);
		System.out.print("\nguest pass: " + base64guest);

		//------------------

	}

