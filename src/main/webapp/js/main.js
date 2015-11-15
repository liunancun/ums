/**
 * 得到ContextPath
 * 
 * @returns
 */
function getContextPath() {
	var localObj = window.location;
	var contextPath = localObj.pathname.split("/")[1];
	return contextPath;
}