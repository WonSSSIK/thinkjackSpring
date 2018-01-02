package persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import domain.UserVO;
import dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;
	
	final String namespace = "mapper.UserMapper";
		
	
	
	@Override
	public void insertUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertUser",vo);
	}

	@Override
	public UserVO authenticate(String str) throws Exception {

		//System.out.println("dao"+str);
		return session.selectOne(namespace+".checkdupl", str);
	}

	@Override
	public UserVO authenticateName(String str) throws Exception {

		//System.out.println("dao"+str);
		return session.selectOne(namespace+".checkduplName", str);
	}

	@Override
	public void createAuthKey(String userEmail, String userAuthCode) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserAuthCode(userAuthCode);
		vo.setUserEmail(userEmail);

		session.update(namespace + ".createAuthKey", vo);
	}

	//이메일 인증 코드 확인
	@Override
	public UserVO chkAuth(UserVO vo) throws Exception {

		return session.selectOne(namespace + ".chkAuth", vo);
	}

	@Override
	public void userAuth(UserVO vo) throws Exception {
		session.update(namespace + ".userAuth", vo);
	}

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		//System.out.println("userDAO dto: "+dto);
		return session.selectOne(namespace+".login",dto);
			
	}

	@Override
	public UserVO read(UserVO vo) throws Exception {
		return session.selectOne(namespace+".readUser",vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		System.out.println(vo);
		session.update(namespace+".updateUser",vo);
	}

	@Override
	public void deleteUser(UserVO vo) throws Exception {
		session.update(namespace+".deleteUser",vo);
	}

	@Override
	public void naverInsertUser(LoginDTO dto) throws Exception {
		System.out.println("naverInsertUser "+dto);
		session.insert(namespace+".naverInsertUser",dto);
	}

	@Override
	public UserVO naverReadUser(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".naverReadUser",dto);
	}

	@Override
	public void updateAuthKey(String userEmail, String userAuthCode) throws Exception {
		UserVO vo = new UserVO();
		vo.setUserAuthCode(userAuthCode);
		vo.setUserEmail(userEmail);

		session.update(namespace + ".createAuthKey", vo);
	}

	@Override
	public void updatePassword(UserVO vo) throws Exception {
		session.update(namespace+".updatePassword",vo);
	}

	@Override
	public void successAuth(UserVO vo) throws Exception {
		session.update(namespace+".successAuth",vo);
	}
}
