package JUnit;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.travels.entity.BusBean;

import com.travels.repository.*;

class JUnitTesting {

	BusBean bb= new BusBean();

	void testDelete() throws ClassNotFoundException, SQLException, IOException {
		bb.setBusid(50);
		assertEquals(1, BusesDao.deleteBus(bb));
	}
	@Test
	void testAddBus() throws ClassNotFoundException, SQLException, IOException {
		bb.setBusnumber("987654");
		bb.setBustype("AC");
		bb.setCapacity(15);
		bb.setTravelid(2);
		assertEquals(1, BusesDao.addBus(bb));
	}

	void testGetBusesCount() throws ClassNotFoundException, SQLException, IOException {
		assertEquals(1, BusesDao.getBusesCount());
	}
}
