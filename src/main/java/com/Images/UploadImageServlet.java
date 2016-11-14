package com.Images;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
			  HttpSession session = req.getSession(true);
			
			Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
			
		        List<BlobKey> blobKeys = blobs.get("myFile");

		        if (blobKeys == null || blobKeys.isEmpty()) {
		            res.getWriter().println("There is no Image");
		        } else {
		            res.sendRedirect("/ImageDisplay.jsp?blob-key=" + blobKeys.get(0).getKeyString());
		        }
		    }
	}


