package com.fin.app.admin.donationManagement;

import java.util.List;

public interface DonationManagementService {
	public List<DonationManagement> listDonation() throws Exception;
	
	public int totalDonation() throws Exception;
}
