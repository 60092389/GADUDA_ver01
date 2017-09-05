# GADUDA_ver01

하이요
신박한조


D:\app\bit\product\11.2.0\dbhome_1\NETWORK\ADMIN (오라클 설치된 폴더 경로)
tnsnames.ora 파일이랑 listener.ora 파일의 아이피주소가 자신의 아이피주소로 되어있는지 확인
아이피주소 변경 후 컴퓨터재부팅


src -> main -> webapp -> WEB-INF -> root-context
oracle 빈객체의 주소 설정, mongo 빈객체의 주소 설정


docBase 경로대로 폴더 생성해놓을 것
server.xml의 <host></host> 안에 추가할context


<Context path="/roomimage" reloadable="true" docBase="d:\gaduda\room">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/roomimage" base="d:\gaduda\room"/>      </Context>      <Context path="/profileimage" reloadable="true" docBase="d:\gaduda\profile">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/profileimage" base="d:\gaduda\profile"/>      </Context>      <Context path="/furarrimage" reloadable="true" docBase="d:\gaduda\furniturearr">       <PreResources className="org.apache.catalina.webresources.DirResourceSet"         webAppMount="/furarrimage" base="d:\gaduda\furniturearr"/>      </Context>


