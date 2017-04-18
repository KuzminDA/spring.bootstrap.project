package spring.security.project.configs.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.filter.CharacterEncodingFilter;
import spring.security.project.configs.security.handlers.CustomAuthenticationSuccessHandler;
import spring.security.project.configs.security.service.AuthenticationService;


/**
 * Created by Skrezhet on 09.04.2017.
 */
@Configuration
@ComponentScan("spring.security.project")
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private CustomAuthenticationSuccessHandler successHandler;

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(authenticationService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.authorizeRequests()
                .antMatchers("/registration").permitAll()
                .antMatchers("/user/**").hasAnyAuthority("User", "Admin")
                .antMatchers("/admin/**").hasAnyAuthority("Admin")
                .antMatchers("/").hasAnyAuthority("Admin", "User")
                .and().formLogin().loginPage("/login").successHandler(successHandler)
                .usernameParameter("username").passwordParameter("password")
                .and().exceptionHandling().accessDeniedPage("/access_denied");
    }
}
